# Maintainer: Tomislav Ivek <tomislav.ivek@gmail.com>

pkgname=('conan')
pkgver=1.0.0.beta.3
pkgrel=1
pkgdesc="A distributed, open source, C/C++ package manager."
arch=('any')
url="https://conan.io"
license=('MIT')
makedepends=('python-setuptools')
depends=('python-pyjwt>=1.4.0'
         'python-requests>=2.7.0'
         'python-colorama>=0.3.3'
         'python-yaml>=3.11'
         'python-patch=1.16'
         'python-fasteners>=0.14.1'
         'python-six>=1.10.0'
         'python-node-semver=0.2.0'
         'python-bottle>=0.12.8'
         'python-distro>=1.0.2'
         'python-pluginbase>=0.5'
         'python-pylint>=1.8.1'
         'python-future=0.16.0'
         'python-pygments>=2.0'
         'python-astroid>=1.6')
source=("https://github.com/conan-io/conan/archive/1.0.0-beta.3.tar.gz")
md5sums=('02a2bf1935e870e3551717f3e4e5059f')


build() {
  cd "$srcdir/conan-1.0.0-beta.3"
  python setup.py build
}

package() {
  cd "$srcdir/conan-1.0.0-beta.3"
  python setup.py install --optimize=1 --root=${pkgdir}
  install -m755 -d "${pkgdir}/usr/share/licenses/conan"
  install -m644 LICENSE.md "${pkgdir}/usr/share/licenses/conan/"
  install -m755 -d "${pkgdir}/usr/share/doc/conan"
  install -m644 contributors.txt "${pkgdir}/usr/share/doc/conan/"
}
