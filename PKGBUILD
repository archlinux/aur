# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=open-unmix-umxse-weights
pkgver=1
pkgrel=1
pkgdesc='Speech enhancement model trained on the 28-speaker version of Voicebank+Demand'
arch=('any')
url='https://zenodo.org/records/3786908'
license=('MIT')

source=(
  "${url}/files/noise_04a6fc2d.pth"
  "${url}/files/speech_f5e0d9f9.pth"
  # Substitute license file, as upstream hasn’t provided any
  'LICENSE'
)

sha512sums=(
  '5dc71948bc55c3f89b4e2d26fcf32a9835537750eadf61d9e5d96468c7d7b480200ae772b9db88d645d17a8a12b7226d80cc055e953d9ab5cba1c508f3b87d9e'
  '32832e498f250281d8cc76f097d56d51204f171b77ee886d00cfadcdaa306a685fddc1b33aa1114cbd6eeee8708ec419599f6bc67353a8b22efdbd1e98fbfd0b'
  '46aaaf08d2e3b80c576ba4e3077eefa52e228d042672512de488243b0a7ad1be9ff0775bf7647808472dcbdd05175373360b4366bcf4fc110eb76acfc06fcd55'
)

package() {
  install -D -m 644 -t "${pkgdir}/usr/share/${pkgname}" \
    'noise_04a6fc2d.pth' \
    'speech_f5e0d9f9.pth'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    'LICENSE'
}
