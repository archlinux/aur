# Maintainer: zer0def <zer0def@github>
pkgname=firecracker-bin
pkgver=0.23.0
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
      5a24a95805240c1125f7fd17e69d5fea92781c3767f0a884aa8e433200e8f469b33502342d47843e5612d83d3157df59bf94a960a202978ca70dcf8f31865882
      203d24794c3125afdd8cb1b07e69da4fcc40bdc9a3ec7c8e8a2deb8dc1a691156294eb4168c2422f631136a4fed7413136631b3957999fe00fb645aaed16f87d
    )
    b2sums=(
      cb6a0d356a734ffb28ef6b88517983d1b9efac4127f8979fad085dab503446471d851ec00ff4da39b216f6fc9ba6a5d9d744455c0f1c1cbd7ef881d624536873
      9a92c415e27a8442da18ab3134023acdc7b49f1246d332a864fb700180914c6b9a7f8747b1eef1657290df5287a946e0d5b0b689bd0b7a60486b472ba7b55290
    )
  ;;
  aarch64)
    sha512sums=(
      08a51979e5979cbc5e8477e9400bcc03757a416e606903296764982f78a432749d168c4566d31df20a9bf68894b3e7cb1cbf39aee559513daa25280a9c891d2f
      48de8688cf40e696f0a56689a2e6256f2be159fb1b593b223a9547c4760c1e94e245e1de77bfeeefbeffb8046b33768da1915482a62d6b36321b8c225bdef791
    )
    b2sums=(
      94453641206b32c42f86542d7c38a1e24e991abc1d425183e624f8a72cc74a51cf36e3463bd1c20b309a4bc4e97ebfb8cd95c47061e51cecdb8a8b28120879ad
      def85c85daa27c648c638ed14128fef941a416269c536c55413116a686d5a0e614976fd718576a6e275ff12a1873885e1d569e2e054cb054f1278ecbe1279d74
    )
  ;;
esac

package() {
  install -Dm755 "${srcdir}/firecracker-v${pkgver}-${CARCH}" ${pkgdir}/usr/bin/firecracker
  install -Dm755 "${srcdir}/jailer-v${pkgver}-${CARCH}" ${pkgdir}/usr/bin/jailer
}
