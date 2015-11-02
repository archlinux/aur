#Maintainer wicast <wicastchen at hotmail>

pkgname=glide-bin
_pkgname=glide
pkgver=0.7.0
pkgrel=1
pkgdesc="Simplified Go project management, dependency management, and vendoring."
arch=('x86_64' 'i686')
url=('https://github.com/Masterminds/glide')
licence=('MIT')
provides=('glide=0.7.0')
conflicts=('glide')
source_x86_64=("https://github.com/Masterminds/glide/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux-amd64.tar.gz")
source_i686=("https://github.com/Masterminds/glide/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux-386.tar.gz")
md5sums_x86_64=('b2623e8ae001f7acff519ca0ca6ad112')
md5sums_i686=('10df587fad4b915fe3a9210b21d5b8d8')

if [ "$CARCH" = "i686"  ]; then
    _PKGARCH=386
else
    _PKGARCH=amd64
fi

package() {
    cd $srcdir/linux-$_PKGARCH
    install -Dm755 "$_pkgname" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
