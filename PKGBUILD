# Maintainer: dryes <joswiseman@cock.li>
pkgname='spdifconvert'
pkgver=0.4
pkgrel=1
pkgdesc='a Python script which takes as input an AC3 or DTS file and encapsulates it in an IEC61937 stream.'
url='http://wiki.slimdevices.com/index.php/Play_DVD_Tracks#The_spdifconvert.py_.28version_0.4.29_Utility'
arch=('any')
license=('GPL')
depends=('python2')
makedepends=('dos2unix' 'unzip')
source=('http://wiki.slimdevices.com/uploads/2/28/Spdifconvert.zip')
md5sums=('991c96054906714eeb12239def09ccd7')

package() {
  mkdir -p "${pkgdir}/usr/bin"

  dos2unix "${srcdir}/spdifconvert.py"
  sed -i -r 's|^\#!python|\#\!/usr/bin/python2|' "${srcdir}/spdifconvert.py"

  install -D -m755 "${srcdir}/spdifconvert.py" "${pkgdir}/usr/bin/spdifconvert"
}
