# Maintainer: Albert Graef <aggraef@gmail.com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com

pkgname=steinberg-vst36
pkgver=3.6.7
pkgrel=1
pkgdesc="Steinberg's VST SDK (version 3.6)"
arch=('any')
url="http://www.steinberg.net/en/company/developers.html"
license=('custom')
provides=('steinberg-vst')
source=(http://www.steinberg.net/sdk_downloads/vstsdk367_03_03_2017_build_352.zip)
md5sums=('b4ed4f4f4be77b267f1821fc1413ea36')

package() {
  cd "$srcdir/VST_SDK/VST2_SDK/"

  # install headers
  mkdir -p "$pkgdir/usr/include/vst36/pluginterfaces/vst2.x"
  install -m644 public.sdk/source/vst2.x/* "$pkgdir/usr/include/vst36/"
  install -m644 pluginterfaces/vst2.x/* \
    "$pkgdir/usr/include/vst36/pluginterfaces/vst2.x/"

  # install license
  cd "$srcdir/VST_SDK/VST3_SDK/"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 doc/*License* "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
