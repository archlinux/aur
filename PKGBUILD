# Maintainer: Albert Graef <aggraef@gmail.com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com

pkgname=steinberg-vst36
pkgver=3.6.5
pkgrel=1
pkgdesc="Steinberg's VST SDK (version 3.6)"
arch=('any')
url="http://www.steinberg.net/en/company/developers.html"
license=('custom')
provides=('steinberg-vst')
source=(http://www.steinberg.net/sdk_downloads/vstsdk365_12_11_2015_build_67.zip)
md5sums=('ebe8f242084a742284f7e541f6f1d301')

package() {
  cd "$srcdir/VST3 SDK"

  # install headers
  mkdir -p "$pkgdir/usr/include/vst36/pluginterfaces/vst2.x"
  install -m644 public.sdk/source/vst2.x/* "$pkgdir/usr/include/vst36/"
  install -m644 pluginterfaces/vst2.x/* \
    "$pkgdir/usr/include/vst36/pluginterfaces/vst2.x/"

  # install license
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 doc/*License* "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
