# Maintainer: Tinxy <arch ät tinx døt eu>

pkgname=aard2-slob
_pkgname=slob
pkgver=47.31ad0e7
pkgrel=1
pkgdesc="Aard 2 Dictionary - Tool to work with Slob (sorted list of blobs) dictionary files."
url='https://github.com/itkach/slob'
arch=('any')
license=('GPL3')
depends=('python' 'python-pyicu')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/itkach/slob.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  #python setup.py build
  
  echo "#!/usr/bin/python" > "${srcdir}/${_pkgname}.py"
  cat "${_pkgname}.py" >> "../${_pkgname}.py"
}

package() {
  cd "${srcdir}"
  install -Dm755  "${_pkgname}.py" "${pkgdir}/usr/bin/${_pkgname}"
}
