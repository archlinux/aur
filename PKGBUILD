# Maintainer: Yunindyo Prabowo <yunindyo.prabowo[at]gmail[dot]com>
# Contributor: M Nabil Adani <nblid48[at]gmail[dot]com>

pkgname=stowtui-git
pkgver=1.1.0
pkgrel=1
pkgdesc='stow tui is a Terminal User Interface Program for GNU STOW'
arch=('any')
url="https://github.com/ypraw/stowtui/"
license=('GPLv3')
makedepends=('python-setuptools')
depends=('stow' 'python' 'python-pygments' 'python-wcwidth' 'python-npyscreen')
source=("${pkgname}::git+https://github.com/ypraw/stowtui.git")
sha256sums=('SKIP')

pkgver(){
    cd "${pkgname}"
    git describe --long | cut -d "-" -f 1
}

package() {
   cd "$srcdir/$pkgname"
   python setup.py install --root="$pkgdir/" --optimize=1
}


