# Maintainer: Your Name <youremail@domain.com>
# Credits goes to /u/panoptigram for teaching me things here
# https://www.reddit.com/r/firefox/comments/ktpgls/some_tips_on_disabling_ctrlq_in_linux_not_a_great/ginky1v/

pkgname=firefox_remove_ctrl_q
pkgver=1.0
pkgrel=1
arch=('any')
url=""
license=('Unlicense')
depends=('firefox')
provides=('firefox_remove_ctrl_q')
source=('remove-ctrl-q-prefs.js'
        'remove-ctrl-q.js')
sha256sums=('c13bf7cb0e6bd1af363caa3744593e9b86d8437148d67ee68b8e537d154543a5'
            '876b45a0aa3c4c20a3b58d033aefad03c876f05ce61911e63d88daf3dd887b41')

package() {
	cd "${pkgdir}"
	mkdir -p "usr/lib/firefox/defaults/pref/"
	
	cd "${srcdir}"
	cp remove-ctrl-q-prefs.js "${pkgdir}/usr/lib/firefox/defaults/pref/"
	cp remove-ctrl-q.js "${pkgdir}/usr/lib/firefox/"
}
