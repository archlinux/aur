# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=harmattan
pkgname=ttf-sil-$_pkgname
_fname=${_pkgname^}
pkgver=1.001
pkgrel=3
pkgdesc='An Arabic script font designed for use by languages in West Africa'
arch=('any')
url="https://software.sil.org/$_pkgname"
license=('OFL')
source=("http://software.sil.org/downloads/r/$_pkgname/$_fname-$pkgver.zip")
sha256sums=('bf4b24e5e38c7df908ddff1344de732b20c9f3aafd724e112f4315597aaf6be3')

package() {
    cd "$_fname-$pkgver"
    find -type f -name "$_fname*.ttf" -execdir \
        install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" {} \;
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.txt FONTLOG.txt documentation/*.pdf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}
