# Maintainer: zer0def <zer0def@github>
pkgname=firecracker-bin
pkgver=0.23.1
pkgrel=1
pkgdesc="Secure and fast microVMs for serverless computing"
url="https://github.com/firecracker-microvm/firecracker"
arch=('x86_64' 'aarch64')
license=('Apache:2.0')
provides=('firecracker')
source=(
    "https://github.com/firecracker-microvm/firecracker/releases/download/v${pkgver}/firecracker-v${pkgver}-${CARCH}"
    "https://github.com/firecracker-microvm/firecracker/releases/download/v${pkgver}/jailer-v${pkgver}-${CARCH}"
)

case "${CARCH}" in
  x86_64)
    sha512sums=(
      4bfb756a2ee2942a158857dfe82de838b52bc161d0ba97255eace1af4b57c3a630dfbb51413433a4fbfb3d95ba02719a608c1ea3f28a5485d005daa2c71abbef
      a6829ffbacd35349214087f4ba1b88304c6bfd23b50d9f97319a93fae5c94c6d0590649fbd0917f9d82b6a2a6faab1f7e37a447864a4960e0b77407ae535212a
    )
    b2sums=(
      62315d4962b4debbdac383098e656e6c469b491f7303a7aaab06c885ec653b202f6a49a43ae0b76188d2f73b229c68435e19d316992eed64645decef3f611d5e
      b22a908d551b3da8f882b9c18031f0904808d8f77783c046f9a8855e713074ea61327b7c8c5f875361728bd33e33e4cd84431ead5f1fae68bdca8161e88bdd1c
    )
  ;;
  aarch64)
    sha512sums=(
      a1f5245cbe637f42f1145eb9daf3578610102535a046ea4be93dcd122194fd90305fde32840d59c50b798aa8326ea0d7ed715ab96f980a7d0e66608c33aa7ce0
      38876afcf6c5883b30156246b4b74905157b668a3e6fbe852b38a09a7f5ab5814fb9eaec87ef94390d2a40806c7b387b4266c8a0c4b4fba5e720f61d571bbcd7
    )
    b2sums=(
      2191e73700c9107fc30e84a044c0377c4486ecfee99deba99b0f6400036befca0d2f3f101154d851f0d7423208f8afc28e87678ed6005235ea9757a1913df3f6
      ef0b98a5438880d8473117dc051421faf4c9f4640fe017ba9cedeb88a02ff2a34fe6e0333bb7cb31cd436a95536efe5237d6a49ead6c7d1d3777928cc54f0baf
    )
  ;;
esac

package() {
  install -Dm755 "${srcdir}/firecracker-v${pkgver}-${CARCH}" ${pkgdir}/usr/bin/firecracker
  install -Dm755 "${srcdir}/jailer-v${pkgver}-${CARCH}" ${pkgdir}/usr/bin/jailer
}
