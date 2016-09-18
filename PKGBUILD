#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# region header
# Copyright Torben Sickert (info["~at~"]torben.website) 16.12.2012

# License
# -------

# This library written by Torben Sickert stand under a creative commons naming
# 3.0 unported license. see http://creativecommons.org/licenses/by/3.0/deed.de
# endregion
pkgname=boostnode
pkgver=1.0.9
pkgrel=32
pkgdesc='a high reliable python library'
arch=('any')
url='http://torben.website/boostnode'
license=('CC-BY-3.0')
depends=('python')
makedepends=('git' 'findutils')
source=('git+https://github.com/thaibault/boostnode')
md5sums=('SKIP')

package() {
    install --directory --mode 755 "${pkgdir}/usr/lib/python3.5"
    find "${srcdir}/boostnode" -type f -not -name '*.py' -delete
    rm "${srcdir}/boostnode/.git" --recursive --force
    rm "${srcdir}/boostnode/documentation" --recursive --force
    cp --recursive --force "${srcdir}/boostnode" "${pkgdir}/usr/lib/python3.5"
}
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion
