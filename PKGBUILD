# Maintainer: Rafael Reggiani Manzo <rr.manzo#protonmail.com>

pkgname=mycroft-core
_pkgcommit=eb0a37c
pkgver=0.7.20.${_pkgcommit}
pkgrel=1
pkgdesc="Mycroft Core, the Mycroft Artificial Intelligence platform. Contribute to this package at: https://gitlab.com/rafamanzo/aur-mycroft-core"
arch=('i686' 'x86_64')
url='https://github.com/MycroftAI/mycroft-core'
license=('GPLv3')
depends=('git'
         'python2'
         'python2-virtualenv'
         'python2-setuptools'
         'python2-gobject2'
         'python-virtualenvwrapper'
         'libtool'
         'libffi'
         'openssh'
         'autoconf'
         'bison'
         'swig'
         'glib2'
         's3cmd'
         'portaudio'
         'mpg123'
         'flac'
         'curl'
         'mimic-git'
         'alsa-utils')
makedepends=('sudo')
optdepends=()
conflicts=()
install=mycroft-core.install
# changelog=ChangeLog
# FIXME: The tarball is outdated and not able to pair with home.mycroft.ai
#source=("https://codeload.github.com/MycroftAI/mycroft-core/tar.gz/release/${pkgver}")
#sha512sums=('cd86a76b4131db1b5a172b617ee8ff46d60b8094b8dec9e3a88fe976f7d6c4d9b65b44fd62984d1ce5c8c761f15a341291677b9c1bccc50fead80727b474bca5')
source=("git://github.com/MycroftAI/mycroft-core.git#commit=${_pkgcommit}")
sha512sums=(SKIP) # Git already ensures data consistency

# Valid only when using a tarball
# prepare(){
#   tar xzfv "${pkgver}"
# }

# build() {}

package() {
  mkdir -p ${pkgdir}/usr/share/
  cp -R mycroft-core ${pkgdir}/usr/share/
}
