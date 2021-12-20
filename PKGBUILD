pkgname=vst2sdk
pkgver=3.6.10
pkgrel=2
pkgdesc="Steinberg's VST2 SDK"
arch=('any')
url="http://www.steinberg.net/en/company/developers.html"
license=('eula')
provides=('steinberg-vst36' 'vst2sdk')
conflicts=('steinberg-vst36')
source=("https://web.archive.org/web/20181016150224/https://download.steinberg.net/sdk_downloads/vstsdk3610_11_06_2018_build_37.zip")
sha512sums=('f93a6dc52ed4ba0ed5684cf0e9d5e5cf61dafff8faeea4d006f18a80ea374acc6ec4a8bd94f630aa28852b3f16595fef308baf5783865a8726d7336ab26eb317')

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
  install -m644 doc/*LICENSE* "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
