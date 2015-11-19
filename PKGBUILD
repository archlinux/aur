# Revived from AUR3 : Jens Staal <staal1978@gmail.com>
# Old Maintainer: Giorgio Gilestro <gilest.ro>
pkgname=ugene-external-tools
pkgver=0.2
pkgrel=1
pkgdesc="Third-party executables that can be used as external tools in UGENE"
arch=('i686' 'x86_64')
url="http://ugene.unipro.ru"
license=('GPL')
depends=('ugene')

if   [ "$CARCH" == 'i686' ]; then
  _filename=ext_tools_linux_32-bit
  md5sums=('572f4e95ace77e0de9a8d9bdd4bed01e')
elif [ "$CARCH" == 'x86_64' ]; then
  _filename=ext_tools_linux_64-bit
  md5sums=('d9f06c3eb85d6c9b4319eac325969f6d')
fi

source=( ${url}/downloads/${_filename}.tar.gz )


package() {
  install -d $pkgdir/usr/share/ugene/external-tools

  cd $srcdir/${_filename}
  cp -ra * $pkgdir/usr/share/ugene/external-tools/
  
  msg "congratulations!"
  msg2 "navigate to Settings > Preferences > External Tools"
  msg2 "set path to /usr/share/ugene/external-tools"
  
}


 
