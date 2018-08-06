# Maintainer: Sherlock Holo <sherlockya@gmail.com>
pkgname=pyunz-git
_pkgname=pyunz
pkgver=0.2.3.r4.ga2db5ac
pkgrel=4
pkgdesc='extract packages easily'
arch=(any)
url='https://github.com/Sherlock-Holo/pyunz'
license=('GPL3')
depends=('python' 'zip' 'unzip' 'p7zip')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/Sherlock-Holo/${_pkgname}")

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package(){
        cd $srcdir/$_pkgname
        python3 setup.py install --root="$pkgdir/" --optimize=1
        mv "${pkgdir}/usr/bin/pyunz.py" "${pkgdir}/usr/bin/pyunz"
        mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
        install -m755 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
md5sums=('SKIP')
