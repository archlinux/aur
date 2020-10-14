# Maintainer: zer0def <zer0def@github>
pkgname=firecracker-bin
pkgver=0.22.1
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
      5327a22a1c0dc4e9a1ceba8455933131ddb9ef91e0a9b875a7b5c5f45f309fe40b841a26b5d0bdd24e18bb7472c264598d59fb0db20bdf5ec39f47b23ede44fa
      f28b08c5baf003eae93bbb7199136c76b9c104928ccb74ad7ca3af0269c4eebd80528a995caa5aff5bc70997932cd1485e416046a8e4a6c199be430c4a72213a
    )
    b2sums=(
      1513ed2b0ad550a0e21fb77bc5fb84091ff73b4e79c716238b14366234d303bb391d3e6a58878529f8131c72bd53d81a18caf06230d290bbefc08f280d856e5c
      f592c951594a2739cb56accbfc2c971f44aa7d4fde36d8a170b8c72749ba25020caf6505865ca9ab4932386b9a9a4e0b2bf984fc2712b6d4c5bf7c3df23aa085
    )
  ;;
  aarch64)
    sha512sums=(
      4d9222e19d616a017780711c426d0aa5b41571e744648cc3a922601857387ebcb9dc0a238019e7a33e45445221d93d739c0ec8c465ab922583bac2970a1af003
      6e147d581870a46e6cad7efb949265a47d1471ae5744216f8a591ffa00001590e2939b8153107b3188e224069207c82624efc98ae5d5becb6c324860ce509548
    )
    b2sums=(
      e5705e423e032c480bbdd499bb4e0b5674079b096bd0983f21f3e9c664d442a76f3a195075a641445505b777823a4c1670a1544828b84370e21d5bde4c091ed3
      7e5e1d106789af37a9a113b005184c2e65943beaec08e99b149bdcd72237c089d9a8126e2b498b433dd94181ab8042205cad31beba1352707081fdc08e7a4293
    )
  ;;
esac

package() {
  install -Dm755 "${srcdir}/firecracker-v${pkgver}-${CARCH}" ${pkgdir}/usr/bin/firecracker
  install -Dm755 "${srcdir}/jailer-v${pkgver}-${CARCH}" ${pkgdir}/usr/bin/jailer
}
