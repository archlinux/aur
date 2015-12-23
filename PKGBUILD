# Contributor: foxbunny <bg.branko@gmail.com>
# Maintainer: Vinzenz Vietzke <vinz@vinzv.de>

pkgname="eci-icc"
pkgver=2009
pkgrel=3
pkgdesc="ICC profiles from ECI (European Color Initiative) with documentation"
arch=('i686' 'x86_64')
url="http://www.eci.org/"
license=('Custom')
makedepends=('unzip')
source=(
  "http://www.eci.org/lib/exe/fetch.php?id=en%3Adownloads&cache=cache&media=downloads:icc_profiles_from_eci:eci_offset_2009.zip"
  "http://www.eci.org/lib/exe/fetch.php?id=en%3Adownloads&cache=cache&media=downloads:icc_profiles_from_eci:eci_offset_cont_2004.zip"
  "http://www.eci.org/lib/exe/fetch.php?id=en%3Adownloads&cache=cache&media=downloads:icc_profiles_from_eci:eci_gravure_psr_v2_2009.zip"
  "http://www.eci.org/lib/exe/fetch.php?id=en%3Adownloads&cache=cache&media=downloads:icc_profiles_from_eci:ecirgbv20.zip"
  "http://www.eci.org/lib/exe/fetch.php?id=en%3Adownloads&cache=cache&media=downloads:icc_profiles_from_eci:ecirgbv10.zip"
)
md5sums=(
  'cf98d2ed58d8951c3473defa02cea4be'
  'a2776270b2bd0d670949c423b2aeafd3'
  '8c534eb4e3b27678b49153f9f5747450'
  '20761e99976df9636bcf87ebe0d7e244'
  'c2d0cbf4b75b659c517ff0826cd3407b'
)

package() {
  mkdir -p ${pkgdir}/usr/share/color/icc || return 1
  mkdir -p ${pkgdir}/usr/share/doc/eci-icc || return 1

  for file in ${srcdir}/ECI_Offset_2009/*.icc
  do
      install -m644 $file ${pkgdir}/usr/share/color/icc || return 1
  done

  for file in ${srcdir}/ECI_Offset_2009/*.pdf
  do
      install -m644 $file ${pkgdir}/usr/share/doc/eci-icc || return 1
  done

  for file in ${srcdir}/ECI_Offset_cont_2004/*.icc
  do
      install -m644 $file ${pkgdir}/usr/share/color/icc || return 1
  done

  for file in ${srcdir}/ECI_Offset_cont_2004/*.pdf
  do
      install -m644 $file ${pkgdir}/usr/share/doc/eci-icc || return 1
  done

  for file in ${srcdir}/eci_gravure_psr_v2_2009/*.pdf
  do
      install -m644 $file ${pkgdir}/usr/share/doc/eci-icc || return 1
  done

  for file in ${srcdir}/eci_gravure_psr_v2_2009/ICC-Profiles/*.icc
  do
      install -m644 $file ${pkgdir}/usr/share/color/icc || return 1
  done

  for file in ${srcdir}/eciRGB_v2_profile/*.icc
  do
      install -m644 $file ${pkgdir}/usr/share/color/icc || return 1
  done

  install -m644 ${srcdir}/eciRGB_v2_profile/licence.rtf \
  ${pkgdir}/usr/share/doc/eci-icc || return 1

  install -m644 ${srcdir}/eciRGBv10/ECI-RGB.V1.0.icc \
  ${pkgdir}/usr/share/color/icc || return 1

  install -m644 ${srcdir}/eciRGBv10/ECI-RGB_BitteLesen \
  ${pkgdir}/usr/share/doc/eci-icc || return 1

  install -m644 ${srcdir}/eciRGBv10/ECI-RGB_ReadMe \
  ${pkgdir}/usr/share/doc/eci-icc || return 1
}