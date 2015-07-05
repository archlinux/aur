# Contributors:
#   henning mueller <henning@orgizm.net>
#   Ahmad24, duncant, echoblack, niki, ShadowKyogre, s1gma, test0
#
# Find this package in the AUR:
#   https://aur.archlinux.org/packages/linux-pax-flags
#
# Please report bugs and new flags on GitHub:
#   https://github.com/nning/linux-pax-flags
#

pkgname=linux-pax-flags
pkgdesc='Deactivates PaX flags for several binaries to work with PaX enabled kernels.'
pkgver=2.0.16
pkgrel=4
arch=(any)
url='https://github.com/nning/linux-pax-flags'
license=(GPL3)
depends=(ruby paxctl)
optdepends=('sudo: Run as root automatically.')
source=(
  $pkgname.sh $pkgname.rb $pkgname.8
  android.conf browsers.conf clamav.conf games.conf imagemagick.conf java.conf
  kde.conf polkit.conf qemu.conf ruby.conf simple.conf skype.conf steam.conf
  valgrind.conf wine.conf
)

package() {
  install -D -m755 $srcdir/$pkgname.sh $pkgdir/usr/bin/$pkgname
  install -D -m755 $srcdir/$pkgname.rb $pkgdir/usr/bin/$pkgname.rb
  install -D -m644 $srcdir/$pkgname.8  $pkgdir/usr/share/man/man8/$pkgname.8

  for config in $srcdir/*.conf; do
    install -D -m600 $config $pkgdir/usr/share/$pkgname/$(basename $config)
  done

  mkdir -p $pkgdir/etc/pax-flags
}

sha256sums=('8581506830903ffcbb0876e4380d660ff044d9805d68f1432753c5bb99dc0db9'
            '4eaab9347a35c39f13e23866da943b21e4e26bc882b066ef504e4374d9a79311'
            '2020957abcd75d71b7f7dcca49eb3ff5f655eb69a306159eaf2e7d3a60c1ad5c'
            '29d27cf02b1683ed1017775c24476ec7cfcec3d69d2b2d4fd0263252ef01ce46'
            '5f81411fd2e7c15ceed6d04eb1a38bdcf6117b401e180c64b463e6d63e55827b'
            'bb87f4dce8e20f2ce601bdcb888dd688d8f0e9d0ab367e09c8081daffa15b03a'
            'c0b7b6c71490ba3a446db31598b78a8ccb1130f7fa181edb38aa022d9aa1076f'
            '7dc92a303004c9d74a1fe4d40d75105a703366ade8b2b459b0aae8d6f8b62ed0'
            '71afe786955d149fe216ff1a60348562914a6820d3b7f9dc42aa44913062b04e'
            '01ddeec77c605e1d3aa00a1fdc4c3537989468ab78da5f37b893cdbcfe34176c'
            '1f205fddfb427a696fb00221a3007453e25fbbf180ea026c264d23eeac9e1870'
            '2736d0ef20d0127c34e132db38d8993dee3062ba0ac0cdf8d444a8d3665698b8'
            'e5562d68df885c5ceeb51709fc57c86d7b2c7849b9d99f828a77228878e25d71'
            'ea10930e4b20064f104a476958b2f794d6220ac8a1c39b8f3105f7914c61d9f9'
            '459925589cc1c7b3c4e548c0ab30ae8c8780d093d6ff2bfc3c27e9712b032c9e'
            '561ec088f1408e35046ad6d5ef6eac0ede40f97e0a6cc28b470a19c611c970b2'
            'ea003c4201745cd0c4bcf5cec5ca2d0a79cc6b1b04ceaa276ace0ad0287b8c50'
            'd78fe0a02b5801c70e3d64045b12c3cbee358689da9082d71003b1cffda73ee3')
