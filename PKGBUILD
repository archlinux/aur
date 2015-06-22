# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com> 
# Contributor: Mathieu Pasquet <mathieui> <mathieuivi@gmail.com>

pkgname=python-openglcontext
pkgver=2.2.0a3
pkgrel=1
arch='any'
pkgdesc="OpenGLcontext is a learning environment for PyOpenGL."
depends=('python2-opengl')
url="http://pyopengl.sourceforge.net/context"
source=("https://pypi.python.org/packages/source/O/OpenGLContext/OpenGLContext-2.2.0a3.tar.gz")
license='BSD' #BSD-style, though, see license.txt in the archive file

provides=('python2-openglcontext')

md5sums=('b5bdedbdae5215e7acff3b087c8220d3')

pkgver() {
  cd openglcontext
  echo $(grep __version__ OpenGLContext/__init__.py | sed 's/__version__ = "//' | sed 's/"//')
}

build() {
  cd openglcontext
  python2 setup.py build
}

package() {
  cd openglcontext
  python2 setup.py install --root=$pkgdir
}
