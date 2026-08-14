# Maintainer: Ismail Ivanov <ismailfilipov321@gmail.com>
pkgname=deepfilternet-plus-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="AI noise suppression: LADSPA mic plugin for EasyEffects/PipeWire and deep-filter CLI (prebuilt)"
arch=('x86_64')
url="https://github.com/ismailivanov/DeepFilterNetPlus"
license=('MIT OR Apache-2.0')
provides=('deepfilternet-plus' 'deep-filter' 'libdeep_filter_ladspa')
conflicts=('deepfilternet-plus-git' 'libdeep_filter_ladspa')
optdepends=('easyeffects: use the plugin as microphone noise suppression (Deep Noise Remover)')
source=("deep-filter-${pkgver}::${url}/releases/download/v${pkgver}/deep-filter-linux-x86_64"
        "libdeep_filter_ladspa-${pkgver}.so::${url}/releases/download/v${pkgver}/libdeep_filter_ladspa.so"
        "LICENSE-MIT-${pkgver}::${url}/raw/v${pkgver}/LICENSE-MIT"
        "LICENSE-APACHE-${pkgver}::${url}/raw/v${pkgver}/LICENSE-APACHE")
sha256sums=('0252e94a5d388045e58f25799f4818210f1ed91639dccfe56eae0e5d0972b2da'
            '7994ccd41d113d3f97fa1ab7cf4742af56c1b1e88f31d8a86395bd07eb019583'
            '24e6bb09c928af8d8e56268082f87413247ce36b39dd5d33add2f9893968065e'
            '1eaee808c5fb6b4e895ba30425285a5cdc5dd25bba2cd230f264c2200c331aec')

package() {
  install -Dm755 "deep-filter-${pkgver}" "${pkgdir}/usr/bin/deep-filter"
  install -Dm755 "libdeep_filter_ladspa-${pkgver}.so" "${pkgdir}/usr/lib/ladspa/libdeep_filter_ladspa.so"
  install -Dm644 "LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 "LICENSE-APACHE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
