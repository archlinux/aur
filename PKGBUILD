# Maintainer: Bink
pkgname=dmarc-report-viewer-bin
pkgver=2.6.0
pkgrel=1
pkgdesc="Standalone DMARC and SMTP TLS report viewer with embedded HTTP server"
arch=('x86_64')
url="https://github.com/cry-inc/dmarc-report-viewer"
license=('MIT')
depends=()
source=("${url}/releases/download/${pkgver}/linux-x86_64.zip")
sha256sums=('f02827a170c82ad15c6aa685ed66a2659d90fe87a9655ad11fa4c6191164d2c5')
b2sums=('46b4a4c6eb06651400e143ad25dd7773a95c1ffacaf4cb621c915b06c0b83010fc008b05d8640f56f2f9af772b26a42d91d4d33923ebfdfef993a9b56ac282b9')

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
