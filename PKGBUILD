# Maintainer: Silvio Ankermann < silvio at booq dot org >

pkgname=prosody-filer
pkgver=1.0.2
pkgrel=1
pkgdesc='Golang mod_http_upload_external server for Prosody'
url='https://github.com/ThomasLeister/prosody-filer'
license=('MIT')
arch=('any')
depends=()
makedepends=()
backup=("etc/prosody-filer.toml")
install=prosody-filer.install
source=("https://github.com/ThomasLeister/${pkgname}/releases/download/v${pkgver}/${pkgname}"
	"https://github.com/ThomasLeister/${pkgname}/archive/v${pkgver}.tar.gz"
	"prosody-filer.service")
sha256sums=('08a9b511af012b7290835ae537a39468c5f17a7a5b6a184d4ee8257249e82477'
            'd044a2904b6fae9ceb98cdd247bc0f7a3626c4eb6a2dd471744a4f75a211cfb0'
            '3f64c61eb4bd0d801c8a24d4bf3eae1e04c82ade000d363081d0d673eaaabe9f')



package() {
    cd "${srcdir}"
    install -D -m755 prosody-filer "${pkgdir}/usr/bin/prosody-filer"
    install -D -m644 "prosody-filer-${pkgver}/config.example.toml" "${pkgdir}/etc/prosody-filer.toml"
    install -D -m644 prosody-filer.service "${pkgdir}/usr/lib/systemd/system/prosody-filer.service"
}
