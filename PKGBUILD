pkgname=eureqa-bin
pkgver=1.24.0
pkgrel=1
pkgdesc='Scientific data mining software using symbolic regression technique'
arch=('x86_64')
url="http://nutonian.wikidot.com"
license=(custom)
depends=(libxext libsm fontconfig libxrender)
_pkgver="${pkgver//./_}"
_pkg="eureqa_${_pkgver}_X11_${CARCH/_/-}"
source=("http://download.nutonian.com/$_pkgver/$_pkg.tar.gz"
        "eureqa.sh"
        "eureqa.desktop")
sha256sums=('14e626fa9aa48900cd95ed3ee5d198a56b6fea117d8ae041451cfccd629e07df'
            'adfb577f86b93fd8461d4d5e13f6d8d7923acdf2cc9eacd977a5d99ce7b2f330'
            '95c14337fdeb510803ea4740c4c15ab03d4687cd977fad5f77a5d925c0935e5f')

package() {
    cd "$_pkg"
    install -Dm755 eureqa $pkgdir/usr/lib/eureqa/eureqa
    install -m644 *.wav $pkgdir/usr/lib/eureqa
    install -Dm644 EULA.rtf $pkgdir/usr/share/licenses/eureqa-bin/EULA.rtf
    install -Dm755 $srcdir/eureqa.sh $pkgdir/usr/bin/eureqa
    install -Dm644 $srcdir/eureqa.desktop $pkgdir/usr/share/applications/eureqa.desktop
}
