# Maintainer: Bink
pkgname=dmarc-report-viewer-bin
pkgver=2.5.2
pkgrel=1
pkgdesc="Standalone DMARC and SMTP TLS report viewer with embedded HTTP server"
arch=('x86_64')
url="https://github.com/cry-inc/dmarc-report-viewer"
license=('MIT')
depends=()
source=("${url}/releases/download/${pkgver}/linux-x86_64.zip")
sha256sums=('9a0e8558abbc11b1cd33d3874755c1a9de57852f40332f9ada00a5c6bbd39258')
b2sums=('75ad209f0d21567d1b9f60b4bc10da7edc5f4807edada32df9120aa330db43345c9163de7c00c4c24af262dba68dc2e896bb9f3e33e4e68d1eb4628cf6dd67e0')

package() {
    install -Dm755 "${srcdir}/linux-x86_64/dmarc-report-viewer" "${pkgdir}/usr/bin/dmarc-report-viewer"
}

post_install() {
    cat << 'EOF'

==> dmarc-report-viewer configuration
Add the following to your ~/.bashrc to configure dmarc-report-viewer:

# dmarc-report-viewer
export IMAP_HOST=some.mail.server
export IMAP_USER=email@mail.server
export IMAP_PASSWORD='someAccountPassword'
export HTTP_SERVER_PASSWORD='somePassword'

Then reload your shell with: source ~/.bashrc

For more configuration options, run: dmarc-report-viewer --help

EOF
}
