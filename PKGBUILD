# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=sophia-nubian
pkgname=ttf-sil-$_pkgname
_fname=SophiaNubian
pkgver=1.0
pkgrel=5
pkgdesc='Unicode font with coverage of Coptic Unicode character set for Nubian languages'
arch=('any')
url="https://software.sil.org/${_pkgname/-}"
license=('OFL')
conflicts=('ttf-sil-fonts<=6')
source=("http://software.sil.org/downloads/r/${_pkgname/-}/$_fname-$pkgver.zip")
sha256sums=('d1c4748b712cd43f3fd30f8a6a34ee362d102912e900c82f04380206ae7b9b5f')

package() {
    cd "$_fname"
    find -type f -name "SN*.ttf" -execdir \
        install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" {} \;
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" Readme.txt FONTLOG.txt
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}
