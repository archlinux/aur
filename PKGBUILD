# Maintainer:  Sébastien "Seblu" Luttringer

pkgname=installsystems
pkgver=9
pkgrel=1
pkgdesc='Easy Installation Framework'
arch=('any')
license=('GPL2')
url='https://github.com/seblu/installsystems'
groups=('base')
makedepends=("git")
depends=('python2' 'python2-psutil' 'python2-progressbar' 'python2-jinja')
optdepends=('python2-paramiko: support ssh repositories')
source=("git+https://github.com/seblu/installsystems.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
  cd $pkgname
  python2 setup.py build
}

package() {
  cd $pkgname
  python2 setup.py install --root="$pkgdir" --optimize=1
  # fix bash completion path
  cd "$pkgdir"
  install -dm755 usr/share/bash-completion
  mv etc/bash_completion.d usr/share/bash-completion/completions
}

# vim:set ts=2 sw=2 et:
