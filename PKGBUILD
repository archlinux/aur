# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com> 
# Contributor: Mathieu Pasquet <mathieui> <mathieuivi@gmail.com>

pkgname=python2-openglcontext-bzr
pkgver=2.2.0a3.567
pkgrel=1
arch='any'
pkgdesc="OpenGLcontext is a learning environment for PyOpenGL."
depends=('python2-opengl')
url="http://pyopengl.sourceforge.net/context"
source=("bzr+lp:openglcontext")
license='BSD' #BSD-style, though, see license.txt in the archive file

provides=('python2-openglcontext')
conflicts=('python2-openglcontext')

md5sums=('SKIP')

pkgver() {
  cd openglcontext
  version=$(grep __version__ OpenGLContext/__init__.py | sed 's/__version__ = "//' | sed 's/"//')
  revision=$(bzr revno)
  echo $version.$revision
}

build() {
  cd openglcontext
  python2 setup.py build
}

package() {
  cd openglcontext
  python2 setup.py install --root=$pkgdir
}
