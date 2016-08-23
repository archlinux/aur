# Maintainer: Tjaart van der Walt <archlinux@tjaart.co.za>

# TODO: There are more optional dependencies we should add: jpegoptim facedetect

pkgname=fgallery
pkgver=1.8.2
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='a modern, minimalist javascript photo gallery'
url='https://www.thregr.org/~wavexx/software/fgallery/'
license=('GPL')
depends=('fbida' 'imagemagick' 'lcms' 'perl>=5.14' 'perl-json' 'perl-image-exiftool' 'python-pyqt4' 'zip')
optdepends=('pngcrush' 'p7zip')
source=("https://github.com/wavexx/fgallery/archive/fgallery-${pkgver}.tar.gz")
sha256sums=('3c9f558b97db57d66ad26885d9fb0738a771d775a40648df6afa4d212dd35750')

destdir="/usr/share/fgallery"
bindir="/usr/bin"
mandir="/usr/share/man"

package() {
  # make desired dirs
  mkdir -p ${pkgdir}${destdir}
  mkdir -p ${pkgdir}${bindir}

  # Copy the source to destdir
  cp -r ${srcdir}/fgallery-fgallery-${pkgver}/*  ${pkgdir}${destdir}

  # Add a  shortcut to fgallery in bin dir
  echo "${destdir}/fgallery \$@" >  ${pkgdir}${bindir}/fgallery
  chmod 755 ${pkgdir}${bindir}/fgallery

  # Add a shortcut to the fcaption util in /usr/local/bin 
  echo  "${destdir}/utils/fcaption" > ${pkgdir}${bindir}/fcaption
  chmod 755 ${pkgdir}${bindir}/fcaption


  # # Copy the fgallery manpage
  # mkdir -p ${pkgdir}${mandir}
  # cp ${srcdir}/fgallery.1 ${pkgdir}${mandir}/man.1/fgallery.1  
}

