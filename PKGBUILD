#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=python3-gpg_batch_sign
pkgver=2022
pkgrel=7
pkgdesc='A module and stand-alone script for batch-signing files with GPG.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/python3-gpg_batch_sign"
depends=(python3)
makedepends=(python-setuptools)
source=(
  https://xyne.dev/projects/python3-gpg_batch_sign/src/python3-gpg_batch_sign-2022.tar.xz
  https://xyne.dev/projects/python3-gpg_batch_sign/src/python3-gpg_batch_sign-2022.tar.xz.sig
)
sha512sums=(
  05c4cb69bf381a45476cc13eb4275294e9bb8d5d85cb54a13591e0081a1b7e69ae3f93490f31581115012a426192306d1be8690f37eff27543c43e8f19a7b522
  420d039f57951bfba3bc656825ec3f7a683c2380a2352b67420005e808856e16d0d08f8c8a16332839908b9b4ddd5e7f3493b210e8d0f54bbe81896e981b637b
)
md5sums=(
  bb35cd96fd71f822ceebec9589409e30
  f39a32c297d9dcdb7c79866623e4e5e6
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 gpg-batch_sign "$pkgdir"/usr/bin/gpg-batch_sign
}


# vim: set ts=2 sw=2 et:
