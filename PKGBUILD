# Maintainer: Oirio Joshi <joshirio@protonmail.com>
pkgname=megacmd-bin
pkgver=0.9.9
pkgrel=2
pkgdesc="MEGA Command Line Interactive and Scriptable Application"
arch=('i686' 'x86_64')
url="http://mega.nz/cmd"
license=('custom')
depends=('glibc' 'gcc-libs' 'openssl' 'sqlite' 'zlib' 'libpsl' 'icu' 'bash-completion' 'pcre' 'bzip2' 'xz')
provides=('megacmd' 'ffmpeg-mega')
source=('LICENSE')
source_x86_64=('https://mega.nz/linux/MEGAsync/Arch_Extra/x86_64/megacmd-x86_64.pkg.tar.xz')
source_i686=('https://mega.nz/linux/MEGAsync/Arch_Extra/i686/megacmd-i686.pkg.tar.xz')
sha256sums=('772d38729ab816eb94dbe30de277ffcc5af4e5d2c451cf7c071031ebe78f44ea')
sha256sums_i686=('b390317c060354c241da255f2757b5af2f80e7b8a24e2c47a42b39cf363bb284')
sha256sums_x86_64=('371f61f0584c04a9b47abbcd8b3bf5e324d80d2b05a53576c5d863d322d73663')

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

