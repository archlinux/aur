# Maintainer: Bink
pkgname=dmarc-report-viewer-bin
pkgver=2.4.1
pkgrel=3
pkgdesc="Standalone DMARC and SMTP TLS report viewer with embedded HTTP server"
arch=('x86_64')
url="https://github.com/cry-inc/dmarc-report-viewer"
license=('MIT')
depends=()
source=("${url}/releases/download/${pkgver}/linux-x86_64.zip")
sha256sums=('1df99a5dfb8719e37a5b530d8821070459b3dc231e3fa57773f3b9828323db97')
b2sums=('9a5ef6b156c0b498f6d0c4456b28ed97fdf4d3a8b51eb29f117ab8af84d16b00403f2c3fcc573fc1735e2ea1be3e2556f557bd792cedd58e2c54a3e3054ac540')

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
