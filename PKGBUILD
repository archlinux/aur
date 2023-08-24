# Maintainer: Tom van der Lee <t0m.vd.l33@gmail.com>
pkgname=liquidprompt
pkgver=2.1.2
pkgrel=2
pkgdesc="A useful adaptive prompt for Bash & Zsh"
arch=("any")
url="https://github.com/nojhan/liquidprompt"
license=("AGPL3")
conflicts=("liquidprompt-git")
depends=("ncurses"
	     "grep"
	     "gawk"
	     "sed"
	     "procps-ng"
	     "inetutils"
	     "coreutils")
optdepends=("acpi: Battery and temperature status"
	        "lm_sensors: Temperature status"
            "screen: Show detached GNU Screen session status"
            "tmux: Show detached tmux session status"
            "git: Show Git repository status"
            "mercurial: Show Mercurial repository status"
            "subversion: Show Subversion repository status"
            "breezy: Show Bazaar repository status"
            "fossil: Show Fossil repository status")
source=("https://github.com/nojhan/liquidprompt/archive/v${pkgver}.tar.gz")
sha256sums=('f752f46595519befd1ad83eaa3605cfc05babd485250a0b46916d8eacabf4f26')

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 liquidprompt "${pkgdir}/usr/bin/liquidprompt"
  install -Dm644 liquidpromptrc-dist "${pkgdir}/etc/liquidpromptrc"
  install -dm755 "${pkgdir}/usr/share/liquidprompt/themes"
  for theme in themes/*; do
    theme_name=$(basename "$theme")
    cp -R "$theme" "${pkgdir}/usr/share/liquidprompt/themes/$theme_name"
  done
}

# vim: set ts=8 sw=8 tw=0 noet :
