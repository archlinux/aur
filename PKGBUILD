# Contributor: Anish Bhatt <anish at gatech [dot] edu>
# Maintainer: Anish Bhatt <anish at gatech [dot] edu>

pkgname=webian-shell
pkgver=0.1
pkgrel=1
pkgdesc='A web browser for devices that dont need a desktop'
arch=('i686' 'x86_64')
url='http://webian.org/'
license=('GPL')
source=("https://github.com/downloads/webianproject/shell/webian_shell_0.1-linux_32.tar.gz")
md5sums=('eb3ff4780c4e9c9927dbee4cb27b4c15')
[[ "${CARCH}" = 'x86_64' ]] && source[0]="https://github.com/downloads/webianproject/shell/webian_shell_0.1-linux_64.tar.gz"
[[ "${CARCH}" = 'x86_64' ]] && md5sums[0]='1345c29fa853b089273b9a09a16295d0'
install='webian-shell.install'
package()
{
	install -d -m 0755 "${pkgdir}/opt/webian-shell"
	pushd ${srcdir}/Webian\ Shell
		rm -rf ./browser_code/.svn
		cp -rp * ${pkgdir}/opt/webian-shell/.
	popd
}
