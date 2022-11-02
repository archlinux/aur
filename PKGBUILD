# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# SELinux Contributor: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=pambase-selinux
pkgver=20221020
pkgrel=1
pkgdesc="SELinux aware base PAM configuration for services"
arch=(any)
url="https://www.archlinux.org"
license=(GPL)
groups=(selinux)
conflicts=("${pkgname/-selinux}" "selinux-${pkgname/-selinux}" 'pam-selinux<1.4.0')
provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}"
          "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
backup=(
  etc/pam.d/system-auth
  etc/pam.d/system-local-login
  etc/pam.d/system-login
  etc/pam.d/system-remote-login
  etc/pam.d/system-services
  etc/pam.d/other
)
source=(
  system-auth
  system-local-login
  system-login
  system-remote-login
  system-services
  other
)
sha512sums=('881f2d76cd5f621b46cc710e9f63269b801b6e03fd3cacf0b31bd1ec2b846c1e610891e2f7a52bfc67917336f411005927a9a6a01f6173143c4ef89a034dc604'
            '83cc3d84ef5afded9afd4d347132901b9adcbd8b21be45b80d010370a2082e8388a713eb78d052944bc47b07fd7383edf18e2674d9d0545215cc45e14a2e14b1'
            '7ffac6ac9e0f75d66cf0de3f4019452052bc3a78067114e89cc38731ba0b585536740b8f741fce6f36246001ab8ddb84a80c7c5c347dcf5df7e51c734570ce0d'
            '83cc3d84ef5afded9afd4d347132901b9adcbd8b21be45b80d010370a2082e8388a713eb78d052944bc47b07fd7383edf18e2674d9d0545215cc45e14a2e14b1'
            '5c2947f8644803783d19cc97ddc19fdaa234dac41a939edd32c9452e78bb2a4751bceeb4737d0791fb122ca932b8b941aab869b6dec3146bf90e94517d31724a'
            'df554f70f017dd3f6023a3c62b95d19123eaf41c08deaac0c4bc343fcce6eeefcf468910f7cb9ba58ee2846abb88091d18d718eb0228e38f6ce26ebced94c407')
b2sums=('2120f15bca3092ce6ed672a3244c1f2d9f13601db3fda83442029d1ceca3a5622b9ce8e215d821ac1e68d30f20556d3ad463fed9f3670778e4b87f4813d7df1b'
        '900a5250f5a9e464c1c3ab8fc112475c99f4d76b597abf362041b661707dcc458cd385fd2cfeecf1ba9e3e831176ca8d183cffc9a913fb79e8ddcaa68223a7e6'
        '9b0a970f2f75bd848c02238ea11d1787b0c4e589ba1492feda537273ecca06c9106dd5dbae82e88637163f94cec27219e17102b325ddef394093b6a726aee926'
        '900a5250f5a9e464c1c3ab8fc112475c99f4d76b597abf362041b661707dcc458cd385fd2cfeecf1ba9e3e831176ca8d183cffc9a913fb79e8ddcaa68223a7e6'
        'e11e8959c961036a384016096f0fce0696d8a3ecc63d0d12d8016cc7c27a7afc80f8580ab639c97360aed0d49af3159462d85260b4404b9d65963f440eb77243'
        '3de32ccd196fecaf0a3cce8e61867f93f85fff651044519d8521a28d9f8d6ddaf51f3e30eac4979884c505f9f52d01f458e5bccc5d5adc4f1d7d372068dd02da')

package() {
  install -vDm 644 "${source[@]}" -t "$pkgdir/etc/pam.d/"
}

# vim:set ts=2 sw=2 et:
