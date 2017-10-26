# Maintainer: nano thirteen <nano13@gmx.net>

_pkgname=('tambi')
pkgname=('tambi-git')
pkgver=583
pkgrel=1
pkgdesc='eine eierlegende wollmilchsau'
arch=('any')
licence=('undecided')
url='https://github.com/nano13/tambi.git'
makedepends=('git' 'python-setuptools')
depends=('python3' 'python-pyqt5' 'qt5-charts' 'python-pyqtchart' 'python-pysword' 'python-markdown' 'python-gpsd' 'python-geopy' 'python-srtm-git' 'python-pillow')
source=(${_pkgname}::git+https://github.com/nano13/tambi.git
    $_pkgname.sh)
sha256sums=('SKIP' 'SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git rev-list --count HEAD
}

package() {
    cd "$srcdir"/"$_pkgname"
    
    mkdir -p "$pkgdir"/usr/share/$pkgname
    mv * "$pkgdir"/usr/share/$pkgname
    #install -dm577 "$pkgdir"/usr/share/$pkgname/
    
    install -Dm755 "$srcdir"/$_pkgname.sh "$pkgdir"/usr/bin/$_pkgname
}
