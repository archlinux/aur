#Maintainer wicast <wicastchen at hotmail>

pkgname=glide-bin
_pkgname=glide
pkgver=0.5.1
pkgrel=1
pkgdesc="Simplified Go project management, dependency management, and vendoring."
arch=('x86_64' 'i686')
url=('https://github.com/Masterminds/glide')
licence=('MIT')
provides=('glide')
conflicts=('glide')
source_x86_64=("https://github.com/Masterminds/glide/releases/download/${pkgver}/${_pkgname}-linux-amd64.zip")
source_i686=("https://github.com/Masterminds/glide/releases/download/${pkgver}/${_pkgname}-linux-386.zip")
md5sums_x86_64=('e98e8762296acf8377fec66b7c924c5e')
md5sums_i686=('607f7e3074df21c5644714e07b95b827')

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
