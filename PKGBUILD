# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=open-unmix-umxhq-weights
pkgver=1.0.1
pkgrel=1
pkgdesc='Music separation model trained on the MUSDB18-HQ dataset'
arch=('any')
url='https://zenodo.org/records/3370489'
license=('MIT')

source=(
  "${url}/files/bass-8d85a5bd.pth"
  "${url}/files/drums-9619578f.pth"
  "${url}/files/other-b52fbbf7.pth"
  "${url}/files/vocals-b62c91ce.pth"
  # Substitute license file, as upstream hasn’t provided any
  'LICENSE'
)

sha512sums=(
  'e083c4118d1fa12bb4e00c3c03cdf2d17056d37724fd2fa3ab8346a896f632e17db31e2b579fbf7cd2837dbd33171a9cd3248927872d81a63e5376c474205c54'
  'b6947dc9cf2f75f9f80e148824cd9cc746944ecbb61f75bab29c5fc39c920fe39488dc4ddff162ad7f2e10bdaa8b3373bee3d2bf9e65f0fba8a439dbfa8314fa'
  '66bf4b9a7602a46b2eb12de14c667caa4ee235ce7207b2b49bc51866509f486803a2f5adafdcf7b98eda2684562264b199fad144b7e15f466a2e80b6f8ee9124'
  '10eafb19abcb4a8e924964882238ea7442db38760cceda415be15600c34c65747e3e369d60a571b160ea4f3c85ffcfd07265b217ed16a6319c234e59d0955ae7'
  '3cfd6d0363ae6cc9abad2507d4e226852f15ac486af4ffa9b4fbf7a2ab5a1bc0c6401efbcc09ddf241d144b24ac8f314864a0569a70ab8bce157c8ee3b91611a'
)

package() {
  install -D -m 644 -t "${pkgdir}/usr/share/${pkgname}" \
    'bass-8d85a5bd.pth' \
    'drums-9619578f.pth' \
    'other-b52fbbf7.pth' \
    'vocals-b62c91ce.pth'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    'LICENSE'
}
