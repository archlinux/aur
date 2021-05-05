# Based on android-tooks PKGBUILD in community
# (git://git.archlinux.org/svntogit/community.git) which has the following
# header:
#     Maintainer: Anatol Pomozov
#     Contributor: 謝致邦 <Yeking@Red54.com>
#     Contributor: Alucryd <alucryd at gmail dot com>

pkgname=mkbootimg
pkgver=31.0.0
_tag=${pkgver}p1 # https://github.com/nmeum/android-tools carries extra patch version on top of the upstream versioning
pkgrel=1
pkgdesc='Tool to create and/or unpack Android boot images'
arch=('armv7h' 'i686' 'x86_64')
url='https://github.com/nmeum/android-tools'
license=(Apache MIT)
# python: for mkbootimg & avbtool scripts
# python2: for unpack_bootimg script
depends=(python python2)
source=(https://github.com/nmeum/android-tools/releases/download/$_tag/android-tools-$_tag.tar.xz)
sha256sums=('51a4c3ba5f16945905449c4bd2c1c781a4df7469f6b7362f8837f4f640d8c7b6')

package() {
  cd android-tools-$_tag

  install -d "$pkgdir"/usr/bin/
  install -m 755 vendor/mkbootimg/mkbootimg.py      "$pkgdir"/usr/bin/mkbootimg
  install -m 755 vendor/mkbootimg/unpack_bootimg.py "$pkgdir"/usr/bin/unpack_bootimg
}
