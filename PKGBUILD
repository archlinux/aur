# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=open-unmix-umx-weights
pkgver=1.0.1
pkgrel=1
pkgdesc='Music separation model trained on the MUSDB18 dataset'
arch=('any')
url='https://zenodo.org/records/3370486'
license=('MIT')

source=(
  "${url}/files/bass-646024d3.pth"
  "${url}/files/drums-5a48008b.pth"
  "${url}/files/other-f8e132cc.pth"
  "${url}/files/vocals-c8df74a5.pth"
  # Substitute license file, as upstream hasn’t provided any
  'LICENSE'
)

sha512sums=(
  '159f541e0e21fcd9505d2cf4e6ec2623fb6850bdde2bcd84537f1060ba26e372a9e43c1d1bbd3d4da6cb75f7d40993fde69e3e7bc48fb83775634948889cce37'
  '316fadd245217df8f5031ac0d5c5b9686abd262bf62cd686891672157a88805c57aa11d43eb85d985b757ec801911f6426e92fc4c9282553f1b8506c0ef55e93'
  '19e77e74e5cf2311dcd74733e0d8dd63c3a8b9fab9282017661c90a41f1091ca5fd1b628f3be371d6b4ab3f0d501d85fc13b8c5af3a426479ccf9f53769a0253'
  '9c6db1a2ad96e9d94bf51c0178e1ae83101b5d4e150e7fc3bbb827c57747c1097f892043feaf8fba8f679cceca6e30407d28c7f0abc86e868dc51aa19d6e136c'
  '3cfd6d0363ae6cc9abad2507d4e226852f15ac486af4ffa9b4fbf7a2ab5a1bc0c6401efbcc09ddf241d144b24ac8f314864a0569a70ab8bce157c8ee3b91611a'
)

package() {
  install -D -m 644 -t "${pkgdir}/usr/share/${pkgname}" \
    'bass-646024d3.pth' \
    'drums-5a48008b.pth' \
    'other-f8e132cc.pth' \
    'vocals-c8df74a5.pth'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    'LICENSE'
}
