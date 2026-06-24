# Maintainer: Arch Linux User <user@example.com>

pkgname=idriveforlinux
pkgver=1.8.0
pkgrel=1
pkgdesc='IDrive Online Backup native desktop application for Linux'
arch=('x86_64')
url='https://www.idrive.com/online-backup-linux'
license=('custom:IDrive')
depends=(
  'alsa-lib'
  'curl'
  'cronie'
  'dbus'
  'desktop-file-utils'
  'gcc-libs'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'icu'
  'libappindicator-gtk3'
  'libcups'
  'libdrm'
  'libglib-2.0.so'
  'libnss_nis'
  'libseccomp'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxcursor'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxinerama'
  'libxkbcommon'
  'libxkbcommon-x11'
  'libxrandr'
  'libxrender'
  'libxss'
  'nss'
  'nspr'
  'python-nautilus'
  'python-gobject'
  'python-psutil'
  'python-watchdog'
  'redis'
  'rsync'
  'sqlite3'
  'systemd-libs'
  'tar'
  'xdotool'
)
optdepends=(
  'nemo-python: Nemo file manager overlay icons'
  'python-caja: Caja file manager overlay icons'
  'dolphin: Dolphin file manager overlay icons'
)
install=idriveforlinux.install
source=("https://www.idrivedownloads.com/downloads/linux/linux-desktop/IDriveForLinux.deb")
sha256sums=('adc5d3fc36852b370d4b0c7fb65125375ddb850c482f6cec9e128187a59f90ac')

package() {
  cd "${srcdir}"

  ar x "IDriveForLinux.deb"
  tar -xJf data.tar.xz -C "${pkgdir}"

  mkdir -p "${pkgdir}/usr/bin"
  ln -sf '/opt/IDriveForLinux/idriveforlinux' "${pkgdir}/usr/bin/idriveforlinux"

  chmod 4755 "${pkgdir}/opt/IDriveForLinux/chrome-sandbox"
}
