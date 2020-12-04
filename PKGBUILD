# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=openhsr-connect-git
pkgver=r172.4d341fb
pkgrel=2
pkgdesc="An open alternative to HSR Mapper for HSR students"
arch=(any)
url="https://github.com/openhsr/connect"
license=('GPL3')
depends=('python' 'python-setuptools' 'python-pysmb' 'python-click'
         'python-ruamel-yaml' 'python-keyring' 'python-jsonschema')
optdepends=('python-keyrings-alt: To use connect without a system keyring')
source=("git+https://github.com/openhsr/connect.git")
sha1sums=('SKIP')

pkgver() {
  cd connect
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd connect
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
