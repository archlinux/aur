# Maintainer: Tjaart van der Walt <archlinux@tjaart.co.za>

# TODO: There are more optional dependencies we should add: jpegoptim facedetect

pkgname=fgallery
pkgver=1.8.1
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='a modern, minimalist javascript photo gallery'
url='https://www.thregr.org/~wavexx/software/fgallery/'
license=('GPL')
depends=('fbida' 'imagemagick' 'lcms' 'perl>=5.14' 'perl-json' 'perl-image-exiftool' 'zip')
optdepends=('pngcrush' 'p7zip')
source=('git+https://github.com/wavexx/fgallery.git')
sha256sums=('SKIP')

package() {
  # Copy the source to /opt/fgallery
  cp -r ${srcdir}  ${pkgdir}/opt
  mkdir -p ${pkgdir}/usr/bin/

  # Add a  shortcut to fgallery in /usr/bin
  echo "/opt/fgallery/fgallery \$@" >  ${pkgdir}/usr/bin/fgallery
  chmod 755 ${pkgdir}/usr/bin/fgallery
  
  # Add a shortcut to the fcaption util in /usr/bin 
  echo  "/opt/fgallery/utils/fcaption" > ${pkgdir}/usr/bin/fcaption
  chmod 755 ${pkgdir}/usr/bin/fcaption
}

