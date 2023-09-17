# Maintainer: Premysl Srubar <premysl.srubar[äT]gmail(.)com>
_pkgname=torchshow
pkgname=('python-torchshow-git')
pkgver=v0.5.0.r6.g08b215b
pkgrel=1
pkgdesc="Torchshow visualizes your data in one line of code. It is designed to help debugging Computer Vision project."
#certifi
depends=(
         'python>=3.6'
         'python-numpy'
         'python-matplotlib'
         ) 
provides=(python-torchshow)
conflicts=(python-torchshow) 
arch=('x86_64')
url="https://github.com/xwying/torchshow"
license=("MIT")
makedepends=('python-setuptools' 'git')
source=("${pkgname}::git+${url}.git")
        
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {  
  cd "$srcdir/${pkgname}"
  python setup.py build
}

package() {
    cd "$srcdir/${pkgname}"
    python setup.py install --root="${pkgdir}" --optimize=1
}


