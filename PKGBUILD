# Maintainer: Oirio Joshi <joshirio@protonmail.com>
pkgname=megacmd-bin
pkgver=1.0.0
pkgrel=2
pkgdesc="MEGA Command Line Interactive and Scriptable Application"
arch=('x86_64')
url="http://mega.nz/cmd"
license=('custom')
depends=('glibc' 'gcc-libs' 'openssl' 'sqlite' 'zlib' 'libpsl' 'icu' 'bash-completion' 'pcre' 'bzip2' 'xz')
provides=('megacmd' 'ffmpeg-mega')
source=('LICENSE')
source_x86_64=('https://mega.nz/linux/MEGAsync/Arch_Extra/x86_64/megacmd-x86_64.pkg.tar.xz')
sha256sums=('772d38729ab816eb94dbe30de277ffcc5af4e5d2c451cf7c071031ebe78f44ea')
sha256sums_x86_64=('88f5e049237dc85391aaccb1c333563cc2c70359bdb47fd48fd2965d839d9400')

package() {
  cd "$srcdir"
  
  # Files
  install -d "${pkgdir}/usr"
  install -d "${pkgdir}/etc"
  cp -R "$srcdir/usr" "${pkgdir}"
  cp -R "$srcdir/etc" "${pkgdir}"

  # Copy license
  install -Dm644 "$srcdir/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

