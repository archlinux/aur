#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=python3-gpg_batch_sign
pkgver=2021.11.20
pkgrel=2
pkgdesc='A module and stand-alone script for batch-signing files with GPG.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/python3-gpg_batch_sign"
depends=(python3)
source=(
  https://xyne.dev/projects/python3-gpg_batch_sign/src/python3-gpg_batch_sign-2021.11.20.tar.xz
  https://xyne.dev/projects/python3-gpg_batch_sign/src/python3-gpg_batch_sign-2021.11.20.tar.xz.sig
)
sha512sums=(
  336133cd07c332cb3cb3c0f6fae63b1905455ea27c5c2d892b54ca2068f10769b889879e34e1db6473940590040ac5984ce41d5b77b38a1707d470a37780bdfd
  a5d65233b762b20f4e231b7ec7331be0ed8702560ed01760b7f340336a249eefd5ec0265fc2dbfe9701bbb7a9cc5a43484c2abd7289d622c45f435538c9da526
)
md5sums=(
  3e6972122f14ef911e0e5203a4f0bef6
  487f41c47c5de1be64f4a34e4ef308d4
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 gpg-batch_sign "$pkgdir"/usr/bin/gpg-batch_sign
}


# vim: set ts=2 sw=2 et:
