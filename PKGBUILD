# Maintainer: Bink
pkgname=dmarc-report-viewer-bin
pkgver=2.4.1
pkgrel=1
pkgdesc="Standalone DMARC and SMTP TLS report viewer with embedded HTTP server"
arch=('x86_64')
url="https://github.com/cry-inc/dmarc-report-viewer"
license=('MIT')
depends=()
source=("${url}/releases/download/v${pkgver}/linux-x86_64.zip")
sha256sums=('fa9774d35df6c1dfd554ff168a85b06a3fd3d7500fee7173ccf5c622d080c0de')
b2sums=('d591509cc97db5151c600cf654b1d8559ab1b3f883f76a3b181b5f8463e8de03a6a30ab522dd79322e41ba7755e4905af6afedd17fabbeba95db8b4db2385174')

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
