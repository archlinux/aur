# Maintainer: Bink
pkgname=dmarc-report-viewer-bin
pkgver=2.5.1
pkgrel=1
pkgdesc="Standalone DMARC and SMTP TLS report viewer with embedded HTTP server"
arch=('x86_64')
url="https://github.com/cry-inc/dmarc-report-viewer"
license=('MIT')
depends=()
source=("${url}/releases/download/${pkgver}/linux-x86_64.zip")
sha256sums=('5ed0183c0c4dbb69015b4aaa4795d5509f501276811ca684b98a18d2cce43f2f')
b2sums=('8d22176482f2c7c404d577105a4c6b81c81aaf421a2c45e97c3f5f641f39a823a5baee07f55729618994cc2f8e095bea8e48586a4b17781f4f892e22376c9d16')

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
