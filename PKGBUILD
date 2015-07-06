# Maintainer : realitygaps <realitygaps@yahoo.com>
pkgname=pythoncard
pkgver=0.8.2
pkgrel=1
pkgdesc="PythonCard is a GUI construction kit for building cross-platform desktop applications on Windows, Mac OS X, and Linux, using the Python language."
url="http://pythoncard.sourceforge.net/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('python>=2.3' 'wxpython')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://prdownloads.sourceforge.net/sourceforge/$pkgname/PythonCard-$pkgver.tar.gz)
md5sums=('109913b19baba90aff5c95949e5aa1ff')

build() {
  cd $startdir/src/PythonCard-$pkgver
  python setup.py install --root=$startdir/pkg
  rm $startdir/pkg/usr/bin/install-pythoncard.py
  echo "#!/bin/bash" > $startdir/pkg/usr/bin/codeEditor
  echo "python /usr/lib/python3.2/site-packages/PythonCard/tools/codeEditor/codeEditor.py" >> $startdir/pkg/usr/bin/codeEditor
  chmod +x $startdir/pkg/usr/bin/codeEditor
  echo "PythonCard" > $startdir/pkg/usr/lib/python3.2/site-packages/$pkgname.pth
}
