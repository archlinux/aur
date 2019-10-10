# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=ipwndfu-linushenze-git
pkgver=1
pkgrel=1
pkgdesc="Open-source jailbreaking tool for many iOS devices"
arch=('x86_64')
url="https://github.com/LinusHenze/ipwndfu_public"
license=('GPL3')
makedepends=('python2')
source=("git+https://github.com/LinusHenze/ipwndfu_public.git"
	"ipwndfu.sh"
	"ipwnrecovery.sh"
	"ibootpatcher.sh")
sha512sums=('SKIP'
            'fc3cadfd5b8b04cb411f3d30e86f7db731a0521ad114dabacbcc0e1d883145b93e39645ae3e50db5c1ffeb773d71f4c41b6fa3098317ca3dc3b0be03e2049ef0'
            '9589ceb40fcf43f7922d20500c6851e5e59c91c7ae8cea7d45b4acbf8368f9397666da3394ecac3f9ad955889a820fd3ce6911a646288ee936cf6b94c13a188d'
            '2eedf2828955f56ed7534e8fe24b47160fc2ea5a62dffbda1c4180859b1689b074a740deea1d8ea62d05ba8043ccc5e4bd9d2bd772882cfb056e0e52dd54980a')

package() {
  mkdir -p "${pkgdir}/usr/lib"
  cp -r "${srcdir}/ipwndfu_public" "${pkgdir}/usr/lib/ipwndfu"
  install -Dm 755 "${srcdir}/ipwnrecovery.sh" "${pkgdir}/usr/bin/ipwnrecovery"
  install -Dm 755 "${srcdir}/ipwndfu.sh" "${pkgdir}/usr/bin/ipwndfu"
  install -Dm 755 "${srcdir}/ibootpatcher.sh" "${pkgdir}/usr/bin/ibootpatcher"
}
