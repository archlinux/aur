# Maintainer: Jeremy Kescher <jeremy@kescher.at>
pkgname=hellpot-bin
_targetname=hellpot
pkgver=0.3
pkgrel=1
_srcname=HellPot-$pkgver
pkgdesc="An endless honeypot that sends bots to hell. (Bin version)"
arch=('i486' 'i586' 'i686' 'pentium4' 'x86_64')
url="https://github.com/yunginnanet/HellPot"
license=('MIT')
provides=('hellpot')
conflicts=('hellpot')
source_i486=("$_targetname::https://github.com/yunginnanet/HellPot/releases/download/v0.3/HellPot-0.3-linux-386")
source_i586=("$_targetname::https://github.com/yunginnanet/HellPot/releases/download/v0.3/HellPot-0.3-linux-386")
source_i686=("$_targetname::https://github.com/yunginnanet/HellPot/releases/download/v0.3/HellPot-0.3-linux-386")
source_pentium4=("$_targetname::https://github.com/yunginnanet/HellPot/releases/download/v0.3/HellPot-0.3-linux-386")
source_x86_64=("$_targetname::https://github.com/yunginnanet/HellPot/releases/download/v0.3/HellPot-0.3-linux-amd64")
source=(
    "service"
    "tmpfiles"
    "sysusers"
    "config.toml"
)
backup=('etc/hellpot/config.toml')
sha256sums=('0136fd65b73e678d12ddff09cd5f71bfea360787cf7955770fe95b64dabe8274'
            'a370bd1f4f1caa1aa4777e3a6cb6c752f711721c9913e09c78a11d304bc53b37'
            'd462d4a84021cb2ce0052ba6c46ad0ea6e7aab7a9459d048de892d8503a99aee'
            '8da2c84ec00ff3fc09a468c5389bf9388d3ca59184acfe65f1976e17840371bf')
sha256sums_i486=('c74f19ad905881c58ee53a76ab1a26932f5af9a5705014c7cccbfed9bc8620bb')
sha256sums_i586=('c74f19ad905881c58ee53a76ab1a26932f5af9a5705014c7cccbfed9bc8620bb')
sha256sums_i686=('c74f19ad905881c58ee53a76ab1a26932f5af9a5705014c7cccbfed9bc8620bb')
sha256sums_pentium4=('c74f19ad905881c58ee53a76ab1a26932f5af9a5705014c7cccbfed9bc8620bb')
sha256sums_x86_64=('f840e95211907080f7ca339d0699cfcf95ec58f7ce060d843713950a64f7e466')

package() {
  cd "$srcdir"
  install -Dm755 $_srcname/$_targetname "${pkgdir}"/usr/bin/$_targetname
  install -Dm644 config.toml "${pkgdir}"/etc/$_targetname/config.toml
  install -Dm644 service "${pkgdir}"/usr/lib/systemd/system/$_targetname.service
  install -Dm644 tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/$_targetname.conf
  install -Dm644 sysusers "${pkgdir}"/usr/lib/sysusers.d/$_targetname.conf
}
