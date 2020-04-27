# Maintainer: Silvio Ankermann < silvio at booq dot org >

pkgname=prosody-filer
pkgver=1.0.2
pkgrel=2
pkgdesc='Golang mod_http_upload_external server for Prosody'
url='https://github.com/ThomasLeister/prosody-filer'
license=('MIT')
arch=('any')
depends=()
makedepends=()
backup=("etc/prosody-filer.toml")
install=prosody-filer.install
source=("https://github.com/ThomasLeister/${pkgname}/releases/download/v${pkgver}/${pkgname}_linux_x86_64"
	"https://raw.githubusercontent.com/ThomasLeister/${pkgname}/v${pkgver}/config.example.toml"
	"prosody-filer.service")
sha256sums=('1c195a28a16a1e51a945a8dc094bb9e3af52c739c4e7c0c5eb315da035a03e78'
            '53eab1aea3d7786a554267e5c2e4fdd1fe085d34239b74fc12a713f604f6f0cc'
            '3f64c61eb4bd0d801c8a24d4bf3eae1e04c82ade000d363081d0d673eaaabe9f')



package() {
    cd "${srcdir}"
    install -D -m755 prosody-filer_linux_x86_64 "${pkgdir}/usr/bin/prosody-filer"
    install -D -m644 config.example.toml "${pkgdir}/etc/prosody-filer.toml"
    install -D -m644 prosody-filer.service "${pkgdir}/usr/lib/systemd/system/prosody-filer.service"
}
