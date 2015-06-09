# Maintainer: palmtree5
pkgname=android-bash-completion
pkgver=20131016
pkgrel=1
pkgdesc="Bash completion for android, adb, emulator, fastboot, and repo"
arch=(any)
url="https://github.com/mbrubeck/android-completion"
license=('MIT')
depends=('android-sdk-platform-tools' 'bash' 'bash-completion')
makedepends=('git')
source=('android-completion::git+https://github.com/mbrubeck/android-completion.git')
md5sums=('SKIP')

package() {
  mkdir -p $pkgdir/usr/share/licenses/android-bash-completion/
  mkdir -p $pkgdir/etc/bash_completion.d/
  cd android-completion
  tail -n 22 README.markdown >> $pkgdir/usr/share/licenses/android-bash-completion/LICENSE
  cp android $pkgdir/etc/bash_completion.d/android
  cp repo $pkgdir/etc/bash_completion.d/repo
}
