# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=openhsr-connect-git
pkgver=r104.adc7c2f
pkgrel=1
pkgdesc="An open alternative to HSR Mapper for HSR students"
arch=(any)
url="https://github.com/openhsr/connect"
license=('GPL3')
depends=('python' 'python-setuptools' 'python-pysmb' 'python-click'
         'python-yaml' 'python-keyring' 'python-jsonschema')
optdepends=('python-keyrings-alt: To use connect without a system keyring')
source=("git+https://github.com/openhsr/connect.git")
sha1sums=('SKIP')

pkgver() {
  cd connect
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd connect
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
