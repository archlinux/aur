# Maintainer: gigas002 <gigas002@pm.me>

pkgname=poi-nightly-bin
_pkgname=poi
_releasever=10.8.0
_buildver=7916
pkgver=$_releasever.$_buildver
pkgrel=1
pkgdesc="Scalable KanColle browser and tool"
arch=('x86_64')
url="https://github.com/poooi/poi/"
license=('MIT')
provides=("poi")
depends=('nss' 'gtk3')
conflicts=('poi')
options=(!strip)
source=("https://nightly.poi.moe/$_buildver/$_pkgname-$_releasever.7z"
	    "$_pkgname.sh")
noextract=("$_pkgname-$_releasever.7z")
sha256sums=(
    '12b7920f6c446df78eebf8c96ec1902927debe4835e8359922c8581076556c27'
    'b08d1eb63de3af0c67860fd8bfd709d492ac600eef9c0cd52e2ee65e5ab69194')

package() {
    mkdir -p "${pkgdir}/opt/${_pkgname}/"
	bsdtar -xf "$_pkgname-$_releasever.7z" -C "${pkgdir}/opt/${_pkgname}/"
    chmod 4755 "${pkgdir}/opt/${_pkgname}/chrome-sandbox"
    install -Dm755 "$_pkgname.sh" "${pkgdir}/usr/bin/$_pkgname"
}
