# Maintainer: Luke <Infinitybeond1@protonmail.com>

pkgname='decay-factory'
pkgdesc="A simple cli to convert any image to a Decay themed wallpaper"
pkgver=1.0
pkgrel=1
arch=('x86_64')
url="https://github.com/decaycs/decay-factory"
license=('GPL3')
source=("conv.py::https://raw.githubusercontent.com/decaycs/decay-factory/main/conv.py"
        "decay.sh::https://raw.githubusercontent.com/decaycs/decay-factory/main/decay.sh"
        "req.txt::https://raw.githubusercontent.com/decaycs/decay-factory/main/requirements.txt"
       )
makedepends=('python-pip')
depends=('python3' 'bash')

prepare() {
  pip3 install -r req.txt
}

build() {
  chmod 755 decay.sh
  chmod 755 conv.py
}

package() {
  install -D "conv.py" "$pkgdir/usr/bin/decayFactorypy"
  install -D "decay.sh" "$pkgdir/usr/bin/decayFactory"
}

sha256sums=('SKIP' 'SKIP' 'SKIP')
